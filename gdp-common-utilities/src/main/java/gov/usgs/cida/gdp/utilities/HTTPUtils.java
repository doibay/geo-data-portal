/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.usgs.cida.gdp.utilities;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.util.List;
import java.util.Map; 

/**
 *
 * @author admin
 */
public class HTTPUtils {

	public static InputStream sendPacket(URL url, String requestMethod)
			throws IOException {

		HttpURLConnection httpConnection = openHttpConnection(url,
				requestMethod);

		return getHttpConnectionInputStream(httpConnection);
	}

    public static String getStringFromInputStream(InputStream is) throws IOException {
        Writer writer = new StringWriter();
        char[] buffer = new char[1024];
        try {
            Reader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            int n;
            while ((n = reader.read(buffer)) != -1) {
                writer.write(buffer, 0, n);
            }
        } finally {
            is.close();
        }

        return writer.toString();
    }

	public static HttpURLConnection openHttpConnection(URL url,
			String requestMethod) throws IOException, ProtocolException {

		HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();
		httpConnection.setRequestMethod(requestMethod);

		return httpConnection;
	}

	public static InputStream getHttpConnectionInputStream(HttpURLConnection httpConnection)
			throws IOException {

		return httpConnection.getInputStream();
	}

	public static Map<String, List<String>> getHttpConnectionHeaderFields(HttpURLConnection httpConnection)
			throws IOException {

		return httpConnection.getHeaderFields();
	}

}
