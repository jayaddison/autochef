package autochef.www.link;

import java.io.*;
import java.util.*;

import org.apache.log4j.*;

public class LinkBean
{
    static Properties pr = new Properties();
    static String baseURI = "localhost";

    String linkType = "default";
    String linkParameters = "";

    static
    {
        // Read application settings
        try
        {
            pr.load(LinkBean.class.getResourceAsStream("/autochef.properties"));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        baseURI = pr.getProperty("link.uri");
    }

    public void setLinkType(String value)
    {
        linkType = value;
    }

    public void setLinkParameters(String value)
    {
        linkParameters = value;
    }

    public String getLink()
    {
        return baseURI + "/" + linkType + "/" + linkParameters;
    }
}
