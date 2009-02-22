package autochef.www.common;

import autochef.core.logging.*;

import java.net.*;

public class PageBean
{
    String serverip;
    String clientip;
    String requesturl;
    String referer;
    String useragent;
    String acceptlanguage;

    public void setServerName(String value)
    {
        try
        {
            serverip = InetAddress.getByName(value).getHostAddress();
        }
        catch (UnknownHostException e)
        {
            serverip = "0.0.0.0";
        }
    }
    public void setClientAddress(String value)  { clientip = value; }
    public void setRequestURL(String value)     { requesturl = value; }
    public void setReferer(String value)        { referer = value; }
    public void setUserAgent(String value)      { useragent = value; }
    public void setAcceptLanguage(String value) { acceptlanguage = value; }

    public void logData()
    {
        PageViews.logData(serverip, clientip, requesturl, referer, useragent, acceptlanguage);
    }
}
