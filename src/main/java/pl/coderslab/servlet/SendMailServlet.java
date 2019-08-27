package pl.coderslab.servlet;

import com.sun.mail.iap.Response;
import pl.coderslab.service.SendMailService;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet(name = "send", value = "/offer/view/send")
public class SendMailServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //JSON receive
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String json = "";
        if (br != null) {
            json = br.readLine();
        }
        String[] jsons = json.split("&");
        String to = "";
        String contentType = "";
        String fileName = "";
        String pdf = "";

        //Spliting data and saving to Strings
        for (int i = 0; i < jsons.length; i++) {
            if (jsons[i].contains("eml")) {
                to = jsons[i];
                to = to.replace("%40", "@");
                to = to.replace("eml=", "");
            }

            //decoding json characters
            if (jsons[i].contains("bin")) {
                pdf = jsons[i];
                pdf = pdf.replace("bin=", "");
                pdf = pdf.replace("%3A", ":");
                pdf = pdf.replace("%2B", "+");
                pdf = pdf.replace("%2F", "/");
                pdf = pdf.replace("%3B", ";");
                pdf = pdf.replace("%3D", "=");
                pdf = pdf.replace("%2C", ",");

                //Spliting data info from code
                int From = pdf.indexOf("data:") + "data:".length();
                int To = pdf.lastIndexOf(";");

                String subPdf = pdf.substring(From, To);
                String[] tempInfo = subPdf.split(";");

                //Getting file info from code
                for (int j = 0; j < tempInfo.length; j++) {
                    if (tempInfo[j].contains("filename=")) {
                        fileName = tempInfo[j].replace("filename=", "");
                    } else {
                        contentType = tempInfo[j];
                    }
                }
            }
        }
        //Getting only content of Base64 code
        pdf = pdf.substring(pdf.indexOf(",") + 1);


        //Set email text with username and password
        String from = "example@gmail.com";
        String sub = "Offer Subject";
        String msg = "Your offer has been attached to email, \n Best Regards";
        String username = "username";
        String password = "password";

        //Send email
        SendMailService.sendMail(from, to, sub, msg, pdf, fileName, contentType, username, password);

        String someMessage = "Wiadomość wysłana do: " + to;
    }
}
