ALTER TABLE UNIT_PMC
  ADD CONSTRAINT FK_UNIT_PMC_ID
  FOREIGN KEY (PERSON_MASS_CHANGE_ID) REFERENCES PERSON_MASS_CHANGE (PERSON_MASS_CHANGE_ID)
/
