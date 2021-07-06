import 'shiny';
import tippy from 'tippy.js';
import 'tippy.js/themes/light.css';

import { callTippy } from './bind';

const theme = (opts) => {
	tippy.setDefaultProps(opts);
}

class Tip {
	constructor(){
		this.tooltips = new Map();
	}

	add(selector, instance){
		this.tooltips.set(selector, instance);
	}
	
	fetch(selector){
		this.tooltips.get(selector);
	}

	disable(selectors){
		if(selectors != null){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).disable();
			});
			return ;
		}

		this.tooltips.forEach((value) => {
			value[0].disable();
		});
	}

	enable(selectors){
		if(selectors != null){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).enable();
			});
			return ;
		}

		this.tooltips.forEach((value) => {
			value[0].enable();
		});
	}
	
	destroy(selectors){
		if(selectors != null){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).destroy();
			});
			return ;
		}

		this.tooltips.forEach((value) => {
			value[0].destroy();
		});
	}

	show(selectors){
		if(selectors != null){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).show();
			});
			return ;
		}

		this.tooltips.forEach((value) => {
			value[0].show();
		});
	}

	hide(selectors){
		if(selectors != null){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).hide();
			});
			return ;
		}

		this.tooltips.forEach((value) => {
			value[0].hide();
		});
	}
}

window.tooltips = new Tip();

Shiny.addCustomMessageHandler('tippy-method', function(msg){
	switch(msg.method){
		case 'disable':
			window.tooltips.disable(msg.selector);
			break;
	}
});

export { callTippy, theme }
