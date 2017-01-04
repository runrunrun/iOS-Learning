//
//  SourceEditorCommand.swift
//  XcodeExtension
//
//  Created by Hari Kunwar on 1/4/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import Foundation
import XcodeKit

/**
This file is where you will implement the logic for the extension. The perform(with:completionHandler:) method is called when the user launches your extension. The XCSourceEditorCommandInvocation object contains a buffer property, which is used to access the source code in the currently selected file. The completion handler should be called with value nil if everything went well, otherwise pass it an NSError instance.
 
 - Find Lines With Closure Syntax
 We first create and array of Int values that will contain the line indexes of the modified lines. This is because we don't want to substitute all the lines. We want to replace only the lines that we modify.
 
 We enumerate over all the lines of the invocation.buffer object and we try to find a match for the RegularExpression object. If I remove the escaping characters from the regex, it looks like the following:
 
 1
 {.*(.+).+in
 This regex matches when a string has the following characteristics:
 
 It has a curly open bracket ({), which is followed by 0 or more characters, except a new line character (\n).
 An open parenthesis (() must be found again, followed by 0 or more characters. This part should contain the parameters of the closure.
 We then need to find a closing parenthesis ()), followed by 0 or more characters, which are the optional return types.
 Finally, the in keyword should be found.
 If the RegularExpression object fails to find a match (for example, if the regex is not valid), we call the completionHandler with the error as a parameter. If a string that matches all these conditions is found on a line, we have correctly localized a closure.
 
 - Clean Up Syntax
 When a match is found, we call a utility method on NSString that removes the parentheses. We also need to pass in the range of the match to avoid removing some other parentheses outside of the closure.
 
 - Update Lines
 The last part of code checks that at least a line was changed. If this is true, we call setArray() to substitute back the new lines and the correct indexes. The completion handler is called with the value nil so that Xcode knows that everything went well.
 
 */

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
        var updatedLineIndexes = [Int]()
        
        // 1. Find lines that contain a closure syntax
        for lineIndex in 0 ..< invocation.buffer.lines.count {
            let line = invocation.buffer.lines[lineIndex] as! NSString
            do {
                let regex = try NSRegularExpression(pattern: "\\{.*\\(.+\\).+in", options: .caseInsensitive)
                let range = NSRange(0 ..< line.length)
                let results = regex.matches(in: line as String, options: .reportProgress, range: range)
                // 2. When a closure is found, clean up its syntax
                _ = results.map { result in
                    let cleanLine = line.remove(characters: ["(", ")"], in: result.range)
                    updatedLineIndexes.append(lineIndex)
                    invocation.buffer.lines[lineIndex] = cleanLine
                }
            } catch {
                completionHandler(error as NSError)
            }
        }
        
        // 3. If at least a line was changed, create an array of changes and pass it to the buffer selections
        if !updatedLineIndexes.isEmpty {
            let updatedSelections: [XCSourceTextRange] = updatedLineIndexes.map { lineIndex in
                let lineSelection = XCSourceTextRange()
                lineSelection.start = XCSourceTextPosition(line: lineIndex, column: 0)
                lineSelection.end = XCSourceTextPosition(line: lineIndex, column: 0)
                return lineSelection
            }
            invocation.buffer.selections.setArray(updatedSelections)
        }
        completionHandler(nil)
    }
    
}

extension NSString {
    // Remove the given characters in the range
    func remove(characters: [Character], in range: NSRange) -> NSString {
        var cleanString = self
        for char in characters {
            cleanString = cleanString.replacingOccurrences(of: String(char), with: "", options: .caseInsensitive, range: range) as NSString
        }
        return cleanString
    }
}
