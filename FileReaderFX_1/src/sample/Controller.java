package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.layout.GridPane;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

import java.io.File;

public class Controller {

    public Button chooseButton;
    public Button implementButton;

    @FXML
    private GridPane gridpane;

    @FXML
    public void handleChooseButtonClick(ActionEvent event){
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Open File Dialog");
        Stage stage = (Stage) gridpane.getScene().getWindow();
        fileChooser.showOpenDialog(stage);
    }

    @FXML
    public void handleImplementButtonClick(ActionEvent event){
        System.out.println("Implement Button clicked");
    }

}
