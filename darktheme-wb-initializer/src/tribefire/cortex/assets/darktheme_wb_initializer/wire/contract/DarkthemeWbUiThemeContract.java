// ============================================================================
// Copyright BRAINTRIBE TECHNOLOGY GMBH, Austria, 2002-2022
// 
// This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License along with this library; See http://www.gnu.org/licenses/.
// ============================================================================
package tribefire.cortex.assets.darktheme_wb_initializer.wire.contract;

import com.braintribe.model.style.Color;
import com.braintribe.model.style.Font;
import com.braintribe.wire.api.space.WireSpace;

public interface DarkthemeWbUiThemeContract extends WireSpace {

	Color blackColor();

	Color whiteColor();

	Color blueColor();

	Color redColor();

	Color greenColor();

	Color yellowColor();

	Color grayColor();

	Color lightslateGrayColor();

	Color slateGrayColor();

	Color gainsboroColor();

	Font openSansBlackFont();

	Font openSansWhiteFont();

	Font openSansGrayFont();

	Font gothamBlackFont();

	Font gothamWhiteFont();

	Font gothamGrayFont();

}