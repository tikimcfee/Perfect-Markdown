//
//  PerfectMarkdown.swift
//  Perfect-Markdown
//
//  Created by Rockford Wei on 2017-03-08.
//  Copyright © 2017 PerfectlySoft. All rights reserved.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2017 - 2018 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import upskirt

@available(*, deprecated, message: "Use MarkdownRenderer.defaultExtensionOptions")
public var markdownExtensionOptions: MarkdownExtensionOptions {
  get {
    MarkdownRenderer.defaultExtensionOptions
  }
  set (options) {
    MarkdownRenderer.defaultExtensionOptions = options
  }
}

@available(*, deprecated, message: "Use MarkdownRenderer.defaultHTMLRenderOptions")
public var markdownHTMLRenderOptions: HTMLRenderOptions {
  get {
    MarkdownRenderer.defaultHTMLRenderOptions
  }
  set (options) {
    MarkdownRenderer.defaultHTMLRenderOptions = options
  }
}

public extension MarkdownRenderer {

  /// an OptionSet setting the markdown extensions to use when rendering using `.markdownToHTML` or `.markdownToXHTML`
  static var defaultHTMLRenderOptions = HTMLRenderOptions.default

  /// an OptionSet setting the HTML rendering options to use when rendering using `.markdownToHTML` or `.markdownToXHTML`
  static var defaultExtensionOptions = MarkdownExtensionOptions.default

}

public extension String {

  /// parse a Markdown string into an HTML one, return nil if failed
  var markdownToHTML: String? {
    return renderMarkdown()
  }

  /// parse a Markdown string into an XHTML one, return nil if failed
  var markdownToXHTML: String? {
    renderMarkdown(renderOptions: [MarkdownRenderer.defaultHTMLRenderOptions, .useXHTML])
  }
    
  /// renders a Markdown string using `markdownExtensions` and `renderOptions`
  func renderMarkdown(
    markdownExtensions: MarkdownExtensionOptions = MarkdownRenderer.defaultExtensionOptions,
    renderOptions: HTMLRenderOptions = MarkdownRenderer.defaultHTMLRenderOptions
  ) -> String? {
    MarkdownRenderer(
      markdownExtensions: markdownExtensions,
      renderOptions: renderOptions
    ).callAsFunction(input: self)
  }
}
