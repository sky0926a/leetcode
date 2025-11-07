package diameterofbinarytree

// TreeNode defines a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

// diameterOfBinaryTree returns the length of the longest path between any two nodes.
func diameterOfBinaryTree(root *TreeNode) int {

	maxDepth := 0

	var dfs func(node *TreeNode) int
	dfs = func(node *TreeNode) int {
		if node == nil {
			return 0
		}

		leftDepth := dfs(node.Left)
		rightDepth := dfs(node.Right)

		if (leftDepth + rightDepth) > maxDepth {
			maxDepth = leftDepth + rightDepth
		}

		return max(leftDepth, rightDepth) + 1
	}

	dfs(root)
	return maxDepth
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
