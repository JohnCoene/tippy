import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css'; // optional for styling
import 'tippy.js/animations/scale.css';

export const callTippy = (params) => {
	if(params.options.content != undefined){
		tippy(params.selector, params.options);
		return ;
	}

	tippy(params.selector);
}
