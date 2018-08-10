/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author sonnt5
 */
public class HtmlHelper {
    public static String generateHyperlink(String href, String innerText)
    {
        return "<a id=\"paging\" href=\""+href+"\" >" + innerText+ "</a>";
    }
    
    public static String pagger(int pageIndex, int gap,int totalPage)
    {
        String result = "";
        if(pageIndex > gap)
            result+= generateHyperlink( "viewlist?page=1" , "First    ");
         
        for(int i = Math.max(pageIndex - gap,1);i<pageIndex;i++)
        {
            result+= generateHyperlink( "viewlist?page="+i , "    "+ i );
        }
        
        result+=  "<span class='pageindex'>" +"    "+pageIndex +"    " + "</span>" ;
//        if((totalPage<=gap+1) && (pageIndex==totalPage-1)){
//            result+= generateHyperlink("viewlist?page=" + totalPage, "    " +String.valueOf(totalPage))+"    ";
//            return result;
//        }
        for(int i= pageIndex + 1;i<Math.min(pageIndex+gap, totalPage);i++)
        {
            result+= generateHyperlink( "viewlist?page="+i , "    "+ i );
        }
       
        if(pageIndex < totalPage - gap)
            result+= generateHyperlink( "viewlist?page="+totalPage, "    Last    ");
        
        
        return result;
    }
}
