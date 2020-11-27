package com.common.util;

import java.io.PrintStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HostConfiguration;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpConnection;
import org.apache.commons.httpclient.HttpConnectionManager;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.URI;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.http.entity.StringEntity;

public class HttpUtil
{
  private HttpClient client;
  private PostMethod postMethod;
  private HostConfiguration hostConf;
  private static int CONNECTION_TIMEOUT = 60000;

  private static int RECEIVE_TIMEOUT = 60000;
  
  public HttpUtil(String actionURL) {
	  this.hostConf = new HostConfiguration();
      this.client = new HttpClient();
      this.client.getHttpConnectionManager().getParams().setConnectionTimeout(CONNECTION_TIMEOUT);
      this.client.getHttpConnectionManager().getParams().setSoTimeout(RECEIVE_TIMEOUT);

      this.postMethod = new PostMethod(actionURL);	  
  }

  public String processHTTP(Map request)
    throws Exception
  {
    int statusCode = 0;
    String result = null;
    try
    {      
      this.hostConf.setHost(this.postMethod.getURI().getHost(), this.postMethod.getURI().getPort());
      this.postMethod.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; text/html; charset=UTF-8");
      this.postMethod.setRequestHeader("Cache-Control", "no-cache");

      NameValuePair[] params = makeParam(request);

      this.postMethod.setRequestBody(params);
      try
      {
        statusCode = this.client.executeMethod(this.postMethod);
      }
      catch (Exception ex) {
        ex.printStackTrace();

        throw ex;
      }

      for (Header header : this.postMethod.getResponseHeaders()) {
        System.out.println(header.getName() + "=" + header.getValue());
      }

      if (statusCode == 200)
      {
        result = this.postMethod.getResponseBodyAsString();

        return result.trim();
      } else {
    	  result = this.postMethod.getResponseBodyAsString();
    	  throw new HttpException("서버응답 에러 / " + statusCode + result.trim());
      }
    }
    catch (Exception ex)
    {
      ex.printStackTrace();

      throw ex;
    } finally {
      try {
        if (this.postMethod != null)
          this.postMethod.releaseConnection();
      }
      catch (Exception ex)
      {
        this.postMethod = null;
      }
      try
      {
        if (this.client != null)
          this.client.getHttpConnectionManager().getConnection(this.hostConf).close();
      }
      catch (Exception localException2)
      {
      }
    }
  }

  public NameValuePair[] makeParam(Map request) throws Exception
  {
    int hashSize = request.size();

    Iterator keyset = request.keySet().iterator();
    NameValuePair[] params = new NameValuePair[hashSize];

    String key = "";

    for (int i = 0; i < hashSize; i++) {
      key = (String)keyset.next();
      params[i] = new NameValuePair(key, (String)request.get(key));
    }

    return params;
  }
  
  public void setRequestHeader(String name, String value) {
	  this.postMethod.setRequestHeader(name, value);
  }
  
  public String processJsonHTTP(String request) throws Exception
  {
    int statusCode = 0;
    String result = null;
    try
    {      
      this.hostConf.setHost(this.postMethod.getURI().getHost(), this.postMethod.getURI().getPort());
      this.postMethod.setRequestHeader("Content-Type", "application/json");

      StringRequestEntity requestEntity = new StringRequestEntity(request);       
      this.postMethod.setRequestEntity(requestEntity);

      try
      {
        statusCode = this.client.executeMethod(this.postMethod);
      }
      catch (Exception ex) {
        ex.printStackTrace();

        throw ex;
      }

      for (Header header : this.postMethod.getResponseHeaders()) {
        System.out.println(header.getName() + "=" + header.getValue());
      }

      if (statusCode == 200)
      {
        result = this.postMethod.getResponseBodyAsString();

        return result.trim();
      } else {
    	  result = this.postMethod.getResponseBodyAsString();
    	  throw new HttpException("서버응답 에러 / " + statusCode + result.trim());
      }
    }
    catch (Exception ex)
    {
      ex.printStackTrace();

      throw ex;
    } finally {
      try {
        if (this.postMethod != null)
          this.postMethod.releaseConnection();
      }
      catch (Exception ex)
      {
        this.postMethod = null;
      }
      try
      {
        if (this.client != null)
          this.client.getHttpConnectionManager().getConnection(this.hostConf).close();
      }
      catch (Exception localException2)
      {
      }
    }
  }
}