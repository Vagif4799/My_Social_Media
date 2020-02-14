package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.layout.GridPane;

public class FinalWindowController {

    @FXML
    private Button button;

    @FXML
    private GridPane gridpane2;

    public void handleOkButtonClick(ActionEvent event) {
        System.out.println("Bye");
    }

}
