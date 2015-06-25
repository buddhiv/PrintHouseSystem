/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package printhouseclient;

import com.jtattoo.plaf.aero.AeroLookAndFeel;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author Buddhi
 */
public class PrintHouseClient {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        try {
            UIManager.setLookAndFeel(new AeroLookAndFeel());
        } catch (UnsupportedLookAndFeelException ex) {
            Logger.getLogger(PrintHouseClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        new MainView().setVisible(true);
            
    }
    
}
