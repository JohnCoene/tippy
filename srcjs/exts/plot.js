import 'jquery';
import tippy from 'tippy.js';

export const plot = (opts) => {
	// add plot func
	let options = {
		...opts.options,
		onShow(instance){
			let fn = showPlot(instance, opts.target, opts.plotOptions);
			fn(instance);
		}
	};

	// create tippy
	tippy(opts.selector, options);
}

const showPlot = (instance, plotId, opts) => {
	let src = $(plotId).find('img').prop('src');
	return function(instance){
		const image = new Image();
		image.width = opts.width;
		image.height = opts.height;
		image.style.display = 'block';
		image.src = src;
		// Update the tippy content with the image
		instance.setContent(image);
	};
}

