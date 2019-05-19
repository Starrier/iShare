package org.starrier.ishare.util;

import lombok.Getter;
import lombok.Setter;

/**
 * @author Starrier
 * @date 2019/4/21
 */
@Getter
@Setter
public class Page {

    /**
     * Start data
     */
    int start;

    /**
     * Data on per page.
     */
    int count;

    /**
     * Data in all.
     */
    int total;

    public Page(int start, int count) {
        super();
        this.start = start;
        this.count = count;
    }

    public boolean isHasPreviouse() {
        return start != 0;
    }

    public boolean isHasNext() {
        return start != getLast();
    }

    public int getTotalPage() {
        int totalPage;
        // 假设总数是50，是能够被5整除的，那么就有10页
        if (0 == total % count) {
            totalPage = total / count;
        }// 假设总数是51，不能够被5整除的，那么就有11页
        else {
            totalPage = total / count + 1;
        }
        if (0 == totalPage) {
            totalPage = 1;
        }
        return totalPage;

    }

    public int getLast() {
        int last;
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是40
        if (0 == total % count) {
            last = total - count;
        }// 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else {
            last = total - total % count;
        }

        return (last < 0) ? 0 : last;

    }
}