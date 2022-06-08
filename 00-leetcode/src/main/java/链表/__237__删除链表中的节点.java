package 链表;

/**
 * https://leetcode.cn/problems/delete-node-in-a-linked-list/
 *
 * @author : chuf
 * @date : 2022-06-08
 **/
public class __237__删除链表中的节点 {

    public void deleteNode(ListNode node) {
        node.val = node.next.val;
        node.next = node.next.next;
    }

    public class ListNode {
        int val;
        ListNode next;

        ListNode(int x) {
            val = x;
        }
    }
}
