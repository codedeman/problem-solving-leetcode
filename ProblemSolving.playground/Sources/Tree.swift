import Foundation

public class TreeNode<T> {
    public var value: T
    public var left: TreeNode?
    public var right: TreeNode?

    public init(value: T) {
        self.value = value
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var output = "\(value)"

        if let left = left {
            output += " <- " + left.description
        }

        if let right = right {
            output += " -> " + right.description
        }

        return output
    }
}

//extension ListNode: CustomStringConvertible {
//    public var description: String {
//       guard let next = next else {
//         return "\(val)"
//       }
//       return "\(val) -> " + String(describing: next) + " "
//     }
//}

class BinaryTree<T> {
    var root: TreeNode<T>?

    init(root: TreeNode<T>?) {
        self.root = root
    }

    // Insertion in binary search tree
    func insert(value: T) where T: Comparable {
        if let root = self.root {
            self.insertHelper(root, value: value)
        } else {
            self.root = TreeNode(value: value)
        }
    }

    private func insertHelper(_ node: TreeNode<T>, value: T) where T: Comparable {
        if value < node.value {
            if let leftChild = node.left {
                self.insertHelper(leftChild, value: value)
            } else {
                node.left = TreeNode(value: value)
            }
        } else {
            if let rightChild = node.right {
                self.insertHelper(rightChild, value: value)
            } else {
                node.right = TreeNode(value: value)
            }
        }
    }

//     Search in binary search tree
    func search(value: T) -> TreeNode<T>? where T: Comparable {
        return self.searchHelper(self.root, value: value)
    }

    private func searchHelper(_ node: TreeNode<T>?, value: T) -> TreeNode<T>? where T: Comparable {
        guard let node = node else { return nil }

        if value == node.value {
            return node
        } else if value < node.value {
            return self.searchHelper(node.left, value: value)
        } else {
            return self.searchHelper(node.right, value: value)
        }
    }
}
