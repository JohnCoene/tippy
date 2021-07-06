import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css'; // optional for styling
import 'tippy.js/animations/scale.css';

export const callTippy = (params) => {

	let instance;
	if(params.options.content != undefined){
		params.options.allowHTML = true;
		instance = tippy(params.selector, params.options);
		window.tooltips.add(params.selector, instance);
		return ;
	}

	instance = tippy(params.selector);
	window.tooltips.add(params.selector, instance);
}
