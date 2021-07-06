import 'jquery';

export const plot = (opts) => {

	// hide the plot
	$(opts.target).hide();

	// add plot func
	let options = {
		...opts.options,
		onShow(instance){
			let fn = showPlot(instance, opts.plotId);
			fn(instance);
		}
	}

	// create tippy
	tippy(opts.selector, options);
}

const showPlot = (instance, plotId) => {
	let src = $(`#${plotId}`).prop('src');
	return function(instance){
		// Convert the blob into a URL
		const url = URL.createObjectURL(src);
		// Create an image
		const image = new Image();
		image.width = 200;
		image.height = 200;
		image.style.display = 'block';
		image.src = url;
		// Update the tippy content with the image
		instance.setContent(image);
	};
}

