package converter;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.struts2.util.StrutsTypeConverter;

public class CartIdConverter extends StrutsTypeConverter
{

	/*
	 * 将页面传过来的值转换为list集合
	 * (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2)
	{
		List<String> list = new LinkedList<String>();
		String value = arg1[0];
		StringTokenizer st = new StringTokenizer(value,",");
		while(st.hasMoreElements())
		{
			list.add(st.nextToken());
		}
		return list;
	}

	@Override
	public String convertToString(Map arg0, Object arg1)
	{
		// TODO Auto-generated method stub
		return null;
	}

}
