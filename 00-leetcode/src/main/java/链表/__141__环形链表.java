package 链表;

/**
 * https://leetcode.cn/problems/linked-list-cycle/
 * 解决思路：快慢指针
 *
 * @author : chuf
 * @date : 2022-06-21
 **/
public class __141__环形链表 {

    public boolean hasCycle(ListNode head) {
        if (head == null || head.next == null) {
            return false;
        }
        ListNode slow = head;
        ListNode fast = head.next;
        while (fast != slow) {
            if(fast == null || fast.next == null){
                return false;
            }
            slow = slow.next;
            fast = fast.next.next;
        }
        return true;
    }

    class ListNode {
        int val;
        ListNode next;

        ListNode(int x) {
            val = x;
            next = null;
        }
    }
}
