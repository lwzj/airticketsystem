package com.ssm.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;

import cn.beecloud.BCCache;
import net.sf.json.JSONObject;

public class JsonUtil {
	
	public static void main(String[] args) {
	String jsonString =	"{'retryCounter':9,'transaction_id':'5b2b6e4f207a4c4faa47a12e8eba27d6',"
			+ "'retry_counter':0,'transaction_fee':10,'channelType':'WX','sub_channel_type':'WX_NATIVE',"
			+ "'optional':{'uid':'18550442795','rui':'feng','fee':'0.1','title':'come','did':'15','cid':null},"
			+ "'transaction_type':'PAY','notify_url':'http://www.ordos-edu.com/webHook_receiver',"
			+ "'transactionId':'5b2b6e4f207a4c4faa47a12e8eba27d6','transactionType':'PAY',"
			+ "'channel_transaction_id':'4008322001201610257682969857','transactionFee':10,"
			+ "'tradeSuccess':true,'notifyUrl':'http://www.ordos-edu.com/webHook_receiver',"
			+ "'id':'b50cbfc8-b540-42ed-8408-63aa103d288a','channel_type':'WX','messageDetail':{"
			+ "'transaction_id':'4008322001201610257682969857','nonce_str':'5b2b6e4f207a4c4faa47a12e8eba27d6',"
			+ "'bank_type':'CFT','openid':'oOdojwf9WXUwVdoJJch2XlLpTMkM','fee_type':'CNY','mch_id':'1344273201',"
			+ "'cash_fee':'10','out_trade_no':'5b2b6e4f207a4c4faa47a12e8eba27d6','tradeSuccess':true,'appid':"
			+ "'wx26f8afea0582e2a2','total_fee':'10','trade_type':'NATIVE','result_code':'SUCCESS','time_end':"
			+ "'20161025155827','is_subscribe':'Y','return_code':'SUCCESS'},'message_detail':{'transaction_id':"
			+ "'4008322001201610257682969857','nonce_str':'5b2b6e4f207a4c4faa47a12e8eba27d6','bank_type':'CFT',"
			+ "'openid':'oOdojwf9WXUwVdoJJch2XlLpTMkM','fee_type':'CNY','mch_id':'1344273201','cash_fee':'10',"
			+ "'out_trade_no':'5b2b6e4f207a4c4faa47a12e8eba27d6','tradeSuccess':true,'appid':'wx26f8afea0582e2a2',"
			+ "'total_fee':'10','trade_type':'NATIVE','result_code':'SUCCESS','time_end':'20161025155827',"
			+ "'is_subscribe':'Y','return_code':'SUCCESS'},'trade_success':true,'sign':'77a42748a07e8571e61033ac20b2d2a1',"
	+"'signAll':'c3407cb6ae3e38c02f3f1d57c4af2904','timestamp':1477383300000}";
		/*Map<String,Object> map = getMapFromJson(jsonString);
		JSONObject jsonObject = (JSONObject) map.get("optional");
		String uid = (String) jsonObject.get("uid");
		System.out.println(uid);*/
		JSONObject jsonObj = JSONObject.fromObject(jsonString);
		JSONObject jsonObj1 = jsonObj.getJSONObject("optional");
		String uid = jsonObj1.getString("uid");
		String fee = jsonObj1.getString("fee");
		String cid = jsonObj1.getString("cid");
		System.out.println(uid +"--"+fee+"--"+cid);
		if("null".equals(cid)){
			System.out.println("----");
		}
	}
	//json字符串转化为Map
	public static Map<String,Object> getMapFromJson(String jsonString) {     
        JSONObject jsonObject = JSONObject.fromObject(jsonString);     
        Map<String,Object> map = new HashMap<String,Object>();     
        for(@SuppressWarnings("rawtypes")
		Iterator iter = jsonObject.keys(); iter.hasNext();){     
            String key = (String)iter.next();     
            map.put(key, jsonObject.get(key));     
        }     
        return map;     
    }     
	
	public static boolean verify(String sign, String text, String key, String input_charset) {
        text = text + key;
        String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
        System.out.println("mysign:" + mysign);
        long timeDifference = System.currentTimeMillis() - Long.valueOf(key);
        System.out.println("timeDifference:" + timeDifference);
        if (mysign.equals(sign) && timeDifference <= 300000) {
            return true;
        } else {
            return false;
        }
    }
	public static boolean verifySign(String sign, String timestamp) {
		System.out.println("sign:" + sign);
		System.out.println("timestamp:" + timestamp);
        return verify(sign, BCCache.getAppID() + BCCache.getAppSecret(),
                timestamp, "UTF-8");
    }
	public static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }
	
}