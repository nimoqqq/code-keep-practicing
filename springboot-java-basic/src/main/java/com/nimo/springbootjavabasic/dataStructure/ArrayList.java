package com.nimo.springbootjavabasic.dataStructure;

import java.util.Objects;

/**
 * 动态数组
 * <p>
 * 1. 定义泛型
 *
 * @author : chuf
 * @date : 2022-06-06
 **/
public class ArrayList<E> {

    /**
     * 元素数量
     */
    private int size;

    private E[] elements;

    private static final int DEFAULT_CAPACITY = 10;
    private static final int ELEMENT_NOT_FOUND = -1;

    /**
     * 查询元素的数量
     *
     * @return 元素数量
     */
    public int size() {
        return size;
    }

    /**
     * 元素是否为空
     *
     * @return
     */
    public boolean isElements() {
        return size > 0;
    }

    /**
     * 是否包含某个元素
     *
     * @param element 元素
     * @return true/false
     */
    public boolean contains(E element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }

    /**
     * 添加元素
     *
     * @param element
     */
    public void add(E element) {

    }

    /**
     * 在index位置插入一个元素
     *
     * @param index
     * @param element
     */
    public void add(int index, E element) {
        rangeCheckForAdd(index);

        ensureCapacity(size + 1);

        for (int i = size; i > index; i++) {
            elements[i] = elements[i - 1];
        }
        elements[index] = element;
        size++;
    }

    /**
     * 查看元素索引
     *
     * @param element 元素
     * @return int
     */
    public int indexOf(E element) {
        if (Objects.isNull(element)) {
            for (int i = 0; i < size; i++) {
                if (elements[i] == null) return i;
            }
        } else {
            for (int i = 0; i < size; i++) {
                if (elements[i] == element) return i;
            }
        }
        return ELEMENT_NOT_FOUND;
    }


    private void rangeCheckForAdd(int index) {
        if (index < 0 || index > size) {
            outOfBounds(index);
        }
    }

    private void outOfBounds(int index) {
        throw new IndexOutOfBoundsException("Index:" + index + ", Size:" + size);
    }

    /**
     * 保证要有capacity的容量
     *
     * @param capacity
     */
    private void ensureCapacity(int capacity) {
        int oldCapacity = elements.length;
        if (oldCapacity >= capacity) return;

        // 新容量为旧容量的 1.5 倍
        int newCapacity = oldCapacity + (oldCapacity >> 1);
        E[] newElements = (E[]) new Object[newCapacity];
        for (int i = 0; i < size; i++) {
            newElements[i] = elements[i];
        }
        elements = newElements;
    }
}
