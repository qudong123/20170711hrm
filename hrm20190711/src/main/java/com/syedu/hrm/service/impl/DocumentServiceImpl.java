package com.syedu.hrm.service.impl;

import com.syedu.hrm.bean.Document;
import com.syedu.hrm.dao.DocumentMapper;
import com.syedu.hrm.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentMapper documentMapper;

    @Override
    public void saveDocument(Document document) {

        documentMapper.save(document);

    }

    @Override
    public List<Document> findAllDocument() {

        List<Document> Documents = documentMapper.findAll(null);

        return Documents;
    }

    @Override
    public Document getDocumentById(int id) {
        Document document = documentMapper.get(id);
        return document;
    }
}
