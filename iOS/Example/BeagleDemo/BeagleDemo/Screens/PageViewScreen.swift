/*
 * Copyright 2020 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import Beagle
import BeagleSchema

struct PageViewScreen: DeeplinkScreen {
    init(path: String, data: [String: String]?) {
    }
    
    func screenController() -> UIViewController {
        return Beagle.screen(.declarative(screen))
    }
    
    var screen: Screen {
        return Screen(
            navigationBar: NavigationBar(title: "PageView"),
            child: Container(
                children: [
                    PageIndicator(numberOfPages: 4, currentPage: "@{context}"),
                    PageView(
                        children: Array(repeating: Page(), count: 4).map { $0.content },
                        pageIndicator: PageIndicator(),
                        onPageChange: [SetContext(contextId: "context", value: "@{onChange}")],
                        currentPage: "@{context}"
                    )
                ],
                widgetProperties: WidgetProperties(style: Style(flex: Flex().grow(1))),
                context: Context(id: "context", value: 3)
            )
        )
    }
}

struct Page {
    var content: Container {
        return Container(
            children: [
                Text("Text with alignment attribute set to center", alignment: Expression.value(.center)),
                Text("Text with alignment attribute set to right", alignment: Expression.value(.right)),
                Text("Text with alignment attribute set to left", alignment: Expression.value(.left)),
                Image(.value(.remote(.init(url: .NETWORK_IMAGE_BEAGLE))))
            ],
            widgetProperties: .init(style: Style(flex: Flex().justifyContent(.spaceBetween).grow(1)))
        )
    }
}
