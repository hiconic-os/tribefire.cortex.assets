// ============================================================================
// Copyright BRAINTRIBE TECHNOLOGY GMBH, Austria, 2002-2022
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ============================================================================
package tribefire.cortex.assets.cortex_wb.initializer;

import com.braintribe.model.processing.session.api.collaboration.PersistenceInitializationContext;
import com.braintribe.wire.api.module.WireTerminalModule;

import tribefire.cortex.initializer.support.api.WiredInitializerContext;
import tribefire.cortex.initializer.support.impl.AbstractInitializer;

import tribefire.cortex.assets.cortex_wb.initializer.wire.CortexWbInitializerWireModule;
import tribefire.cortex.assets.cortex_wb.initializer.wire.contract.CortexWbInitializerContract;

public class CortexWbInitializer extends AbstractInitializer<CortexWbInitializerContract> {

	@Override
	public WireTerminalModule<CortexWbInitializerContract> getInitializerWireModule() {
		return CortexWbInitializerWireModule.INSTANCE;
	}

	@Override
	public void initialize(PersistenceInitializationContext context, WiredInitializerContext<CortexWbInitializerContract> initializerContext,
			CortexWbInitializerContract initializerContract) {

		initializerContract.initialize();

	}

}