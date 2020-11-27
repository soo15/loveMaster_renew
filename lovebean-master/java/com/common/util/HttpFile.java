package com.common.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.client.LaxRedirectStrategy;
import org.apache.http.util.EntityUtils;

public class HttpFile {
	
	private CloseableHttpClient httpclient;
	private HttpGet get;
	
	public HttpFile (String actionURL) {
		try {		
			URL rightUrl = new URL(actionURL);
			this.httpclient = HttpClients.custom()
				.setRedirectStrategy(new LaxRedirectStrategy()) // adds HTTP REDIRECT support to GET and POST methods 
				.build();
			this.get = new HttpGet(rightUrl.toURI());
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setRequestHeader(String name, String value) {
		  this.get.addHeader(name, value);
	}
	
	public String sendGetJson() {
		String result = null;
		
		try {
			CloseableHttpResponse httpResponse = httpclient.execute(get);
			result = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
		
		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}
        
		return result;
	}

	public File download(File dstFile) {
		
		try {
			File downloaded = httpclient.execute(get, new FileDownloadResponseHandler(dstFile));
			return downloaded;
		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}
	}
	
	static class FileDownloadResponseHandler implements ResponseHandler<File> {

		private final File target;

		public FileDownloadResponseHandler(File target) {
			this.target = target;
		}

		@Override
		public File handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
			InputStream source = response.getEntity().getContent();
			FileUtils.copyInputStreamToFile(source, this.target);
			return this.target;
		}		
	}

}
