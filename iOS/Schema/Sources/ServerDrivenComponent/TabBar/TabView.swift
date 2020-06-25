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

public struct TabItem: AutoInitiableAndDecodable {

    public let icon: Image.Local?
    public let title: String?
    public let child: RawComponent

// sourcery:inline:auto:TabItem.Init
    public init(
        icon: Image.Local? = nil,
        title: String? = nil,
        child: RawComponent
    ) {
        self.icon = icon
        self.title = title
        self.child = child
    }
// sourcery:end
}

public struct TabView: RawComponent, AutoInitiable, HasContext {
    public let children: [TabItem]
    public let styleId: String?
    public let _context_: Context?

// sourcery:inline:auto:TabView.Init
    public init(
        children: [TabItem],
        styleId: String? = nil,
        _context_: Context? = nil
    ) {
        self.children = children
        self.styleId = styleId
        self._context_ = _context_
    }
// sourcery:end
}
