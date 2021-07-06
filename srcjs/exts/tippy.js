import 'shiny';
import tippy from 'tippy.js';
import 'tippy.js/themes/light.css';
import 'tippy.js/themes/light-border.css';
import 'tippy.js/themes/material.css';
import 'tippy.js/themes/translucent.css';

import { callTippy } from './bind';
import { plot } from './plot';

const defaultProps = (opts) => {
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

	disable(selectors = []){
		if(selectors.length > 0){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).forEach((tip) => {
					tip.disable();
				});
			});
			return ;
		}

		this.tooltips.forEach((tips) => {
			tips.forEach((tip) => {
				tip.disable();
			})
		});
	}

	enable(selectors = []){
		if(selectors.length > 0){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).forEach((tip) => {
					tip.enable();
				});
			});
			return ;
		}

		this.tooltips.forEach((tips) => {
			tips.forEach((tip) => {
				tip.enable();
			})
		});
	}
	
	destroy(selectors = []){
		if(selectors.length > 0){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).forEach((tip) => {
					tip.destroy();
				});
			});
			return ;
		}

		this.tooltips.forEach((tips) => {
			tips.forEach((tip) => {
				tip.destroy();
			})
		});
	}

	show(selectors = []){
		if(selectors.length > 0){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).forEach((tip) => {
					tip.show();
				});
			});
			return ;
		}

		this.tooltips.forEach((tips) => {
			tips.forEach((tip) => {
				tip.show();
			})
		});
	}

	hide(selectors = []){
		if(selectors.length > 0){
			selectors.forEach((selector) => {
				this.tooltips.get(selector).forEach((tip) => {
					tip.hide();
				});
			});
			return ;
		}

		this.tooltips.forEach((tips) => {
			tips.forEach((tip) => {
				tip.hide();
			})
		});
	}
}

window.tooltips = new Tip();

Shiny.addCustomMessageHandler('tippy-method', function(msg){
	switch(msg.method){
		case 'disable':
			window.tooltips.disable(msg.selectors);
			break;
		case 'enable':
			window.tooltips.enable(msg.selectors);
			break;
		case 'show':
			window.tooltips.show(msg.selectors);
			break;
		case 'hide':
			window.tooltips.hide(msg.selectors);
			break;
		case 'destroy':
			window.tooltips.destroy(msg.selectors);
			break;
	}
});

Shiny.addCustomMessageHandler('tippy-plot', function(msg){
	if(msg.hide){
		$(msg.target).hide();
	}

	plot(msg);
});

export { callTippy, defaultProps, plot}
