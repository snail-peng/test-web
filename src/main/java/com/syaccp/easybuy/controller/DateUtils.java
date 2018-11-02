/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.syaccp.easybuy.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import org.apache.commons.lang3.time.DateFormatUtils;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 * 
 * @author jeeplus
 * @version 2014-4-15
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {

	private static String[] parsePatterns = { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM",
			"yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss",
			"yyyy.MM.dd HH:mm", "yyyy.MM" };

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}

	/**
	 * 得到两个日期相差的天数
	 */
	public static int getBetweenDay(Date date1, Date date2) {
		Calendar d1 = new GregorianCalendar();
		d1.setTime(date1);
		Calendar d2 = new GregorianCalendar();
		d2.setTime(date2);
		int days = d2.get(Calendar.DAY_OF_YEAR) - d1.get(Calendar.DAY_OF_YEAR);
		// System.out.println("days="+days);
		int y2 = d2.get(Calendar.YEAR);
		if (d1.get(Calendar.YEAR) != y2) {
			// d1 = (Calendar) d1.clone();
			do {
				days += d1.getActualMaximum(Calendar.DAY_OF_YEAR);
				d1.add(Calendar.YEAR, 1);
			} while (d1.get(Calendar.YEAR) != y2);
		}
		return days + 1;
	}

	/**
	 * 当前日期转GMT
	 * 
	 * @return
	 */
	public static String getCurDateToGMT() {
		String rq = "";
		try {

			TimeZone gmtTime = TimeZone.getTimeZone("GMT");
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			format.setTimeZone(gmtTime);
			rq = format.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rq;
	}

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}

	/**
	 * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String formatDate(Date date, Object... pattern) {
		String formatDate = null;
		if (pattern != null && pattern.length > 0) {
			formatDate = DateFormatUtils.format(date, pattern[0].toString());
		} else {
			formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
		}
		return formatDate;
	}

	/**
	 * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String formatDateTime(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}

	public static String formatDateTime2(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm");
	}

	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}
	
	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime(Date date) {
		return formatDate(date, "HH:mm");
	}


	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTime() {
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}

	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}

	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}

	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}

	public static int getWeekNum() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int weekOfMonth = calendar.get(Calendar.WEEK_OF_MONTH);
		// System.out.println(weekOfMonth);
		return weekOfMonth;
	}

	/**
	 * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
	 * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy.MM.dd",
	 * "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
	 */
	public static Date parseDate(Object str) {
		if (str == null) {
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 获取过去的天数
	 * 
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (24 * 60 * 60 * 1000);
	}

	/**
	 * 获取过去的小时
	 * 
	 * @param date
	 * @return
	 */
	public static long pastHour(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 60 * 1000);
	}

	/**
	 * 获取过去的分钟
	 * 
	 * @param date
	 * @return
	 */
	public static long pastMinutes(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 1000);
	}

	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 * 
	 * @param timeMillis
	 * @return
	 */
	public static String formatDateTime(long timeMillis) {
		long day = timeMillis / (24 * 60 * 60 * 1000);
		long hour = (timeMillis / (60 * 60 * 1000) - day * 24);
		long min = ((timeMillis / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (timeMillis / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		long sss = (timeMillis - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000 - min * 60 * 1000 - s * 1000);
		return (day > 0 ? day + "," : "") + hour + ":" + min + ":" + s + "." + sss;
	}

	/**
	 * 获取两个日期之间的天数
	 * 
	 * @param before
	 * @param after
	 * @return
	 */
	public static double getDistanceOfTwoDate(Date before, Date after) {
		long beforeTime = before.getTime();
		long afterTime = after.getTime();
		return (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
	}

	public static Date stringToDate(String str) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			// Fri Feb 24 00:00:00 CST 2012
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 2012-02-24
		// date = java.sql.Date.valueOf(str);

		return date;
	}

	
	/**
	 * 
	 * @param start_date
	 * @param end_date
	 * @throws ParseException
	 */
	public static int Date_start_end(String start_date, String end_date) {
		int days=0;
		try {
			Calendar dayc1 = new GregorianCalendar();
			Calendar dayc2 = new GregorianCalendar();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date daystart = df.parse(start_date); // 按照yyyy-MM-dd格式转换为日期
			Date dayend = df.parse(end_date);
			dayc1.setTime(daystart); // 设置calendar的日期
			dayc2.setTime(dayend);
			for (; dayc1.compareTo(dayc2) <= 0;) { // dayc1在dayc2之前就循环
				 Calendar temp = Calendar.getInstance();// 需要初始化
				   temp.setTime(dayc1.getTime());
			        int x = temp.get(Calendar.DAY_OF_WEEK);
			        switch (x) {
			        case Calendar.SUNDAY:
			            //System.out.println("星期日");
			            break;
			        case Calendar.MONDAY:
			            //System.out.println("星期一");
			            days++;
			            break;
			        case Calendar.TUESDAY:
			            //System.out.println("星期二");
			            days++;
			            break;
			        case Calendar.WEDNESDAY:
			            //System.out.println("星期三");
			            days++;
			            break;
			        case Calendar.THURSDAY:
			            //System.out.println("星期四");
			            days++;
			            break;
			        case Calendar.FRIDAY:
			            //System.out.println("星期五");
			            days++;
			            break;
			        case Calendar.SATURDAY:
			            //System.out.println("星期六");
			            days++;
			            break;
			       
			        }
				dayc1.add(Calendar.DAY_OF_YEAR, 1); // 加1天
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return days;
	}

	/**
	 * @param Test
	 * @throws ParseException
	 */
	public static void main(String[] args) throws ParseException {
		//Date_start_end("2018-5-1", "2018-5-14");
		System.out.println(formatDate(getTimesmorning()));
		/*
		 * System.out.println("当天24点时间：" + formatDate(getTimesnight(),
		 * "yyyy-MM-dd HH:mm:ss")); System.out.println("当前时间：" + formatDate(new
		 * Date(),"yyyy-MM-dd HH:mm:ss")); System.out.println("当天：" +
		 * formatDate(getTimesmorning(),"yyyy-MM-dd")); System.out.println("昨天："
		 * + formatDate(getYesterdaymorning(),"yyyy-MM-dd"));
		 * System.out.println("近7天时间：" +
		 * formatDate(getWeekFromNow(),"yyyy-MM-dd"));
		 * System.out.println("本周周一时间：" +
		 * formatDate(getTimesWeekmorning(),"yyyy-MM-dd"));
		 * System.out.println("本周周日时间：" +
		 * formatDate(getTimesWeeknight(),"yyyy-MM-dd"));
		 * System.out.println("上周周一时间：" +
		 * formatDate(getLastTimesWeekmorning(),"yyyy-MM-dd"));
		 * System.out.println("上周周日时间：" +
		 * formatDate(getLastTimesWeeknight(),"yyyy-MM-dd"));
		 */
		// System.out.println("本月初时间：" +
		// formatDate(getTimesMonthmorning(),"yyyy-MM-dd"));
		/*
		 * System.out.println("本月未时间：" +
		 * formatDate(getTimesMonthnight(),"yyyy-MM-dd"));
		 * System.out.println("上月初时间：" +
		 * formatDate(getLastMonthStartMorning(),"yyyy-MM-dd"));
		 * System.out.println("上月末时间：" +
		 * formatDate(getLastMonthEndnight(),"yyyy-MM-dd"));
		 * System.out.println("本季度开始时间：" +
		 * formatDate(getCurrentQuarterStartTime(),"yyyy-MM-dd"));
		 * System.out.println("本季度结束时间：" +
		 * formatDate(getCurrentQuarterEndTime(),"yyyy-MM-dd"));
		 * System.out.println("上季度开始时间：" +
		 * formatDate(getLastQuarterStartTime(),"yyyy-MM-dd"));
		 * System.out.println("上季度结束时间：" +
		 * formatDate(getLastQuarterEndTime(),"yyyy-MM-dd"));
		 * System.out.println("本年开始时间：" +
		 * formatDate(getCurrentYearStartTime(),"yyyy-MM-dd"));
		 * System.out.println("本年结束时间：" +
		 * formatDate(getCurrentYearEndTime(),"yyyy-MM-dd"));
		 * System.out.println("上年开始时间：" +
		 * formatDate(getLastYearStartTime(),"yyyy-MM-dd"));
		 */
	}

	/**
	 * 获得当天日期
	 * 
	 * @return
	 */
	public static Date getTimesmorning() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 获得昨天日期
	 * 
	 * @return
	 */
	public static Date getYesterdaymorning() {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(getTimesmorning().getTime() - 3600 * 24 * 1000);
		return cal.getTime();
	}

	/**
	 * 获得当天近7天时间
	 * 
	 * @return
	 */
	public static Date getWeekFromNow() {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(getTimesmorning().getTime() - 3600 * 24 * 1000 * 7);
		return cal.getTime();
	}

	/**
	 * 获得当天24点时间
	 * 
	 * @return
	 */
	public static Date getTimesnight() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 24);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 获得本周 周一 日期
	 * 
	 * @return
	 */
	public static Date getTimesWeekmorning() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return cal.getTime();
	}

	/**
	 * 获得本周 周日 日期
	 * 
	 * @return
	 */
	public static Date getTimesWeeknight() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getTimesWeekmorning());
		cal.add(Calendar.DAY_OF_WEEK, 6);
		return cal.getTime();
	}

	/**
	 * 获得上周 周一 日期
	 */
	public static Date getLastTimesWeekmorning() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getTimesWeekmorning());
		cal.add(Calendar.DATE, -7);
		return cal.getTime();
	}

	/**
	 * 获得上周 周日 日期
	 */
	public static Date getLastTimesWeeknight() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getTimesWeekmorning());
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	/**
	 * 获得本月第一天
	 * 
	 * @return
	 */
	public static Date getTimesMonthmorning() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		return cal.getTime();
	}

	/**
	 * 获得本月最后一天
	 * 
	 * @return
	 */
	public static Date getTimesMonthnight() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		return cal.getTime();
	}

	/**
	 * 上个月1号
	 * 
	 * @return
	 */
	public static Date getLastMonthStartMorning() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getTimesMonthmorning());
		cal.add(Calendar.MONTH, -1);
		return cal.getTime();
	}

	/**
	 * 上月最后一天
	 * 
	 * @return
	 */
	public static Date getLastMonthEndnight() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getTimesMonthmorning());
		cal.add(Calendar.MONTH, -1);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		return cal.getTime();
	}

	/**
	 * 本季度开始日期
	 * 
	 * @return
	 */
	public static Date getCurrentQuarterStartTime() {
		Calendar c = Calendar.getInstance();
		int currentMonth = c.get(Calendar.MONTH) + 1;
		SimpleDateFormat longSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat shortSdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = null;
		try {
			if (currentMonth >= 1 && currentMonth <= 3)
				c.set(Calendar.MONTH, 0);
			else if (currentMonth >= 4 && currentMonth <= 6)
				c.set(Calendar.MONTH, 3);
			else if (currentMonth >= 7 && currentMonth <= 9)
				c.set(Calendar.MONTH, 4);
			else if (currentMonth >= 10 && currentMonth <= 12)
				c.set(Calendar.MONTH, 9);
			c.set(Calendar.DATE, 1);
			now = longSdf.parse(shortSdf.format(c.getTime()) + " 00:00:00");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return now;
	}

	/**
	 * 本季度的结束日期
	 * 
	 * @return
	 */
	public static Date getCurrentQuarterEndTime() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getCurrentQuarterStartTime());
		cal.add(Calendar.MONTH, 3);
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	/**
	 * 上季度开始日期
	 * 
	 * @return
	 */
	public static Date getLastQuarterStartTime() {
		Calendar c = Calendar.getInstance();
		c.setTime(getCurrentQuarterStartTime());
		c.add(Calendar.MONTH, -1);
		int currentMonth = c.get(Calendar.MONTH) + 1;
		SimpleDateFormat longSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat shortSdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = null;
		try {
			if (currentMonth >= 1 && currentMonth <= 3)
				c.set(Calendar.MONTH, 0);
			else if (currentMonth >= 4 && currentMonth <= 6)
				c.set(Calendar.MONTH, 3);
			else if (currentMonth >= 7 && currentMonth <= 9)
				c.set(Calendar.MONTH, 4);
			else if (currentMonth >= 10 && currentMonth <= 12)
				c.set(Calendar.MONTH, 9);
			c.set(Calendar.DATE, 1);
			now = longSdf.parse(shortSdf.format(c.getTime()) + " 00:00:00");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return now;
	}

	/**
	 * 上季度的结束日期
	 * 
	 * @return
	 */
	public static Date getLastQuarterEndTime() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getLastQuarterStartTime());
		cal.add(Calendar.MONTH, 3);
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	/**
	 * 本年开始日期
	 * 
	 * @return
	 */
	public static Date getCurrentYearStartTime() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.YEAR));
		return cal.getTime();
	}

	/**
	 * 本年结束日期
	 * 
	 * @return
	 */
	public static Date getCurrentYearEndTime() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getCurrentYearStartTime());
		cal.add(Calendar.YEAR, 1);
		return cal.getTime();
	}

	/**
	 * 上年开始日期
	 * 
	 * @return
	 */
	public static Date getLastYearStartTime() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getCurrentYearStartTime());
		cal.add(Calendar.YEAR, -1);
		return cal.getTime();
	}

	public static Date dateAdd(int num) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DAY_OF_YEAR, num);
		return cal.getTime();
	}
}
