package 链表;

/**
 * https://leetcode.cn/problems/reverse-linked-list/
 * 需要对当前节点、以及它之前和之后的节点进行缓存，在完成翻转动作
 * @author : chuf
 * @date : 2022-06-09
 **/
public class __206__反转链表 {

    public static void main(String[] args) {
        ListNode head = new ListNode(1);
        ListNode node2 = new ListNode(2);
        ListNode node3 = new ListNode(3);
        ListNode node4 = new ListNode(4);
        ListNode node5 = new ListNode(5);

        head.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;

//        ListNode listNode = reverseList(head);
        ListNode listNode = reverseList1(head);
        System.out.println(listNode);
    }

    /**
     * 递归
     *
     * @param head
     * @return
     */
    public static ListNode reverseList(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }
        ListNode newHead = reverseList(head.next);
        head.next.next = head;
        head.next = null;
        return newHead;
    }

    /**
     * 头插法
     *
     * @param head
     * @return
     */
    public static ListNode reverseList1(ListNode head) {
        ListNode newListNode = null;

        while (head != null) {
            ListNode tmp = head.next;
            head.next = newListNode;
            newListNode = head;
            head = tmp;
        }

        return newListNode;
    }


    public static class ListNode {
        int val;
        ListNode next;

        ListNode() {
        }

        ListNode(int val) {
            this.val = val;
        }

        ListNode(int val, ListNode next) {
            this.val = val;
            this.next = next;
        }
    }
}
