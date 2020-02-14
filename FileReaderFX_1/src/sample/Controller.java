package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.layout.GridPane;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

import java.awt.*;
import java.io.File;
import java.io.IOException;

public class Controller {

    public Button chooseButton;
    public Button implementButton;

    @FXML
    private GridPane gridpane;

    @FXML
    public void handleChooseButtonClick(ActionEvent event) throws IOException {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Open File Dialog");
        Stage stage = (Stage) gridpane.getScene().getWindow();
        File file = fileChooser.showOpenDialog(stage);
        String filePath2 = file.getParent();
        System.out.println(filePath2);
    }

    @FXML
    public void handleImplementButtonClick(ActionEvent event){
        System.out.println("Implement Button clicked");
    }

}
