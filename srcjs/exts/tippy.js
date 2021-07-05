import 'shiny';
import tippy from 'tippy.js';
import 'tippy.js/themes/light.css';

import { callTippy } from './bind';

const theme = (opts) => {
	tippy.setDefaultProps(opts);
}

export { callTippy, theme }
