package com.example.socialmediabyvagif;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Image {

    private Integer id;
    private String name;

    public Image(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

}
