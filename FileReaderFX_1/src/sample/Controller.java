package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

import java.awt.*;
import java.io.File;
import java.io.IOException;

public class Controller {

    @FXML
    public Button chooseButton;
    @FXML
    public Button implementButton;
    @FXML
    public TextField textfield;

    @FXML
    private GridPane gridpane;

    public String mainFilePath;

    @FXML
    public void handleChooseButtonClick(ActionEvent event) throws IOException {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Open File Dialog");
        Stage stage = (Stage) gridpane.getScene().getWindow();
        File file = fileChooser.showOpenDialog(stage);
        String filePath2 = file.getParent();
        mainFilePath = filePath2;
        System.out.println(filePath2);
    }

    @FXML
    public void handleImplementButtonClick(ActionEvent event){
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("FinalWindow.fxml"));
            Parent root1 = (Parent) fxmlLoader.load();
            Stage stage = new Stage();
            stage.setTitle("Final Window");
            stage.setScene(new Scene(root1));
            stage.show();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        // taking text from textfield
        String RRN = textfield.getText();
        // add new code here

        // testing
        System.out.println("Implement Button clicked");
        System.out.println(mainFilePath);
        System.out.println(RRN);
    }



    // end of controller
}
