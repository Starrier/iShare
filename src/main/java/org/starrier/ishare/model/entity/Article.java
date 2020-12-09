package org.starrier.ishare.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * @author Starrier
 * @date 2019/4/11
 */
@Getter
@Setter
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class Article {

    private int id;
    private String title;
    private String content;
    private String date;
    private String summary;
    private String category;
    private int categoryId;
    private String author;
}