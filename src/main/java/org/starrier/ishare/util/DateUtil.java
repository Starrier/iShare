package org.starrier.ishare.util;

import java.sql.Timestamp;
import java.util.Date;

/**
 * @author Starrier
 * @date 2019/4/21
 */
public class DateUtil {

    public static Timestamp dataCovertTimestamp(Date d) {
        return d == null ? null : new Timestamp(d.getTime());
    }

    public static Date timestampConvertDate(Timestamp t) {
        return null == t ? null : new Date(t.getTime());
    }

}