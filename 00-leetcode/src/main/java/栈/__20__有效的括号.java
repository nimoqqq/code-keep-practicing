package 栈;

import java.util.*;

/**
 * @author : chuf
 * @date : 2022-08-24
 **/
public class __20__有效的括号 {

    private static Map<Character, Character> pairs = new HashMap<Character, Character>() {{
        put(')', '(');
        put('}', '{');
        put(']', '[');
    }};

    public boolean isValid(String s) {
        int n = s.length();
        if (n % 2 == 1) {
            return false;
        }
        Deque<Character> stack = new LinkedList<>();
        for (int i = 0; i < n; i++) {
            char ch = s.charAt(i);
            if (pairs.containsKey(ch)) {
                if (stack.isEmpty() || !Objects.equals(stack.peek(), pairs.get(ch))) {
                    return false;
                }
                stack.pop();
            } else {
                stack.push(ch);
            }
        }
        return stack.isEmpty();
    }
}
