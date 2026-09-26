var roads = L.gridLayer
	.googleMutant({
		type: "satellite", // valid values are 'roadmap', 'satellite', 'terrain' and 'hybrid'
	})
	.addTo(map);