package 链表;

/**
 * 给定一个含有 n 个元素的链表，现在要求每 k 个节点一组进行翻转，打印翻转后的链表结果。其中，k 是一个正整数，且可被 n 整除。
 * 例如，链表为 1 -> 2 -> 3 -> 4 -> 5 -> 6，k = 3，则打印 321654
 *
 * @author : chuf
 * @date : 2022-12-30
 **/
public class 反转列表ll {
    public static void main(String[] args) {
        ListNode head = getHead();
        reverseList(head, 3);
    }

    public static void reverseList(ListNode head, int k) {
        ListNode prev = null;
        int i = 0;
        while (head != null) {
            i++;
            ListNode next = head.next;
            head.next = prev;
            prev = head;
            head = next;
            if (i % k == 0) {
                reverseList1(prev, k);
            }
        }
    }

    public static void reverseList1(ListNode head, int k) {
        ListNode nhead = head;
        while (k > 0) {
            k--;
            System.out.printf("%d", nhead.val);
            nhead = nhead.next;
        }
    }


    public static ListNode getHead() {
        ListNode head = new ListNode(1);
        ListNode node2 = new ListNode(2);
        ListNode node3 = new ListNode(3);
        ListNode node4 = new ListNode(4);
        ListNode node5 = new ListNode(5);
        ListNode node6 = new ListNode(6);

        head.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;
        node5.next = node6;
        return head;
    }

    public static void printList(ListNode p) {
        while (p != null) {
            System.out.printf("%d ", p.val);
            p = p.next;
        }
    }
}

class ListNode {
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
