const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const fs = require('fs')

// Shared HTML partials. A page template uses one with <%= footer %>.
// They are re-read on every build, and WatchPartials makes the dev
// server rebuild when one is edited.
const PARTIALS = {
	footer: path.resolve(__dirname, 'src/partials/footer.html'),
};

function readPartials() {
	const out = {};
	for (const [name, file] of Object.entries(PARTIALS)) {
		out[name] = fs.readFileSync(file, 'utf8');
	}
	return out;
}

// Keeps html-webpack-plugin's own template variables and adds the partials.
function withPartials(compilation, assets, assetTags, options) {
	return {
		compilation,
		webpackConfig: compilation.options,
		htmlWebpackPlugin: { tags: assetTags, files: assets, options },
		...readPartials(),
	};
}

class WatchPartials {
	apply(compiler) {
		compiler.hooks.afterCompile.tap('WatchPartials', (compilation) => {
			Object.values(PARTIALS).forEach((file) => compilation.fileDependencies.add(file));
		});
	}
}

const isProduction = process.env.NODE_ENV == 'production';

const stylesHandler = isProduction ? MiniCssExtractPlugin.loader : 'style-loader';


const config = {
	entry: {
		main: './script.js',
		pages: './pages.js',
	},
	output: {
		path: path.resolve(__dirname, 'dist'),
	},
	devServer: {
		open: true,
		host: 'localhost',
		hot: true,
	},
	plugins: [
		new WatchPartials(),
		new HtmlWebpackPlugin({
			template: 'index.html',
			filename: 'index.html',
			templateParameters: withPartials,
			chunks: ['main'],
		}),
		new HtmlWebpackPlugin({
			template: 'about.html',
			filename: 'about.html',
			templateParameters: withPartials,
			chunks: ['pages'],
		}),
		new HtmlWebpackPlugin({
			template: 'contact.html',
			filename: 'contact.html',
			templateParameters: withPartials,
			chunks: ['pages'],
		}),
		new HtmlWebpackPlugin({
			template: 'submit.html',
			filename: 'submit.html',
			templateParameters: withPartials,
			chunks: ['pages'],
		}),
		new HtmlWebpackPlugin({
			template: 'map.html',
			filename: 'map.html',
		}),
		new HtmlWebpackPlugin({
			template: 'googlecee6295620a8d037.html',
			filename: 'googlecee6295620a8d037.html',
		}),
	],
	module: {
		rules: [
			{
				test: /\.(js|jsx)$/i,
				loader: 'babel-loader',
			},
			{
				test: /\.css$/i,
                use: [stylesHandler, 'css-loader', 'less-loader'],
			},
			{
				test: /\.less$/i,
				use: [stylesHandler, 'css-loader', 'less-loader'],
			},
			            {
                test: /\.(woff2?|ttf|eot)(\?v=\w+)?$/,
                type: 'asset/resource',
                generator: {
                    filename: 'fonts/[name][ext][query]',
                }
            },
            {
                test: /\.(png|jpg|gif|ico|svg|webp|json|py|webmanifest|txt|xml)(\?.*)?$/,
                type: 'asset/resource',
				 generator: {
                    filename: '[name][ext][query]',
                }
            },
		],
	},
};

module.exports = () => {
	if (isProduction) {
		config.mode = 'production';
		config.plugins.push(new MiniCssExtractPlugin());
	} else {
		config.mode = 'development';
	}
	
	return config;
};
