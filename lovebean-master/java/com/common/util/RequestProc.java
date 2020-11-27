package com.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class RequestProc
{
    
    public JSONObject sendPacket(String url, JSONObject json_obj)
    {
    	
        String              strJSONObject       = this.excute(url, json_obj);
        JSONObject          jsonObject          = this.str2JSONObject(strJSONObject);

        return jsonObject;
    }
    
    private String excute(String url, JSONObject json_obj)
    {
        HttpClient client = new DefaultHttpClient();
        StringBuffer returnData = new StringBuffer();
        BufferedReader rd = null;
        int soketTimeout = Integer.valueOf(180);
        
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("JSONData", json_obj.toString()));
        
      
        try
        {
            client.getParams().setParameter("http.socket.timeout", new Integer(soketTimeout * 1000));
            client.getParams().setParameter("http.protocol.content-charset", "UTF-8");

            HttpPost post = new HttpPost(url);
            post.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));

            HttpResponse response = client.execute(post);

            rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));

            String line = "";
            while ((line = rd.readLine()) != null)
            {
                returnData.append(line);
            }
            rd.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();

            return null;
        }
        finally
        {
            if (rd != null)
                try
                {
                    rd.close();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            client.getConnectionManager().shutdown();
        }
        return returnData.toString();
    }


    private JSONObject str2JSONObject(String strJSONObject)
    {
        JSONObject json = null;

        try
        {
            JSONParser parser = new JSONParser();
		//System.out.println("DEBUG : json:"+strJSONObject);
            json = (JSONObject) parser.parse(strJSONObject);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        return json;
    }
}
