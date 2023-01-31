      *> ********************************************************************
      *>
      *> (C) Copyright 1984-2019 Micro Focus or one of its affiliates.
      *>
      *> The only warranties for products and services of Micro Focus and
      *> its affiliates and licensors ("Micro Focus") are set forth in the
      *> express warranty statements accompanying such products and services.
      *> Nothing herein should be construed as constituting an additional
      *> warranty.  Micro Focus shall not be liable for technical or editorial
      *> errors or omissions contained herein.  The information contained
      *> herein is subject to change without notice.
      *>
      *> Classic Data File Tools
      *>
      *> @(#)$Id: dfdstaff.cbl 1018038 2020-04-23 12:58:07Z jho $
      *>
      *
      *> *****************************************************************
       
       

      ****************************************************************
      * All Rights Reserved.                                         *
      * This sample code is supplied for demonstration purposes only *
      * on an "as is" basis and is for use at your own risk.         *
      ****************************************************************
      *
      *    NOTE.
      *
      *        This file must be built with the NOIBMCOMP directive.
      * 
      *        Use the COBOL dialect - Non-mainframe or add the
      *        directive NOIBMCOMP to the Additional Directives
      *        when using a mainframe dialect.
      * 
       program-id. Program1 as "dfdstaff".
       
       Environment Division.

       Input-Output Section.

       
       
       File-control.

           Select  MF-FILE    assign to DFDSTAFF
               file status is FILE-STATUS.
           select stafffile assign to DFDSTAFF
                file status is FILE-STATUS.
            
       Data Division.

       File Section.
       FD MF-FILE.
       
       01  EMPLOYEE-REC.
           03  EM-CODE.
               05  EM-POSITION             pic x.
               05  EM-EMP-NUM              pic 9(6).
           03  EM-AGE                  pic 9(2) comp.
           03  EM-YEARS-WITH-COMPANY   pic 9(2) comp.
           03  EM-DETAILS.
               05  EM-NAME.
                   07  EM-TITLE                pic x(5).
                   07  EM-SURNAME              pic x(50).
                   07  EM-INITIALS             pic x(10).
                   07  EM-FIRST-NAME           pic x(50).
               05  EM-ADDRESS.
                   07  EM-STREET               pic x(40).
                   07  EM-TOWN                 pic x(40).
                   07  EM-AREA                 pic x(40).
               05  EM-JOB-TITLE            pic x(20).
               05  EM-DEPARTMENT           pic x(4).
               05  EM-SALARY               pic 9(4)v9(2) comp.
               05  EM-AVERAGE-HOURS-WEEK   pic 9(3) comp.

               05  EM-EXTRAS.
                   07  SLEEPING-ALLOWANCE  pic 9(2) comp.
                   07  EM-LEAVE            pic 9 comp-3.

               05  EM-PREVIOUS-JOBS        pic x(20) occurs 3 times.

               05  EM-COMMENT.
                   07  EM-COMMENTS         pic x(10).
                   07  EM-AUTHOR-EMP-CODE.
                       09  EM-AUTHOR-POS       pic x.
                       09  EM-AUTHOR-NUM       pic 9(6).

       01  MANAGER-REC.
           03  MN-CODE.
               05  MN-POSITION             pic x.
               05  MN-EMP-NUM              pic 9(6).
           03  MN-AGE                  pic 9(2) comp.
           03  MN-YEARS-WITH-COMPANY   pic 9(2) comp.
           03  MN-DETAILS.
               05  MN-NAME.
                   07  MN-TITLE                pic x(5).
                   07  MN-SURNAME              pic x(50).
                   07  MN-INITIALS             pic x(10).
                   07  MN-FIRST-NAME           pic x(50).
               05  MN-ADDRESS.
                   07  MN-STREET               pic x(40).
                   07  MN-TOWN                 pic x(40).
                   07  MN-AREA                 pic x(40).
               05  MN-JOB-TITLE            pic x(50).
               05  MN-DEPARTMENT           pic x(4).
               05  MN-SALARY               pic 9(10)v9(2) comp.
               05  MN-BASIC-LEAVE          pic 9(3) comp-3.
               05  MN-AVERAGE-HOURS-WEEK   pic 9(2) comp.

               05  MN-EXTRAS.
                   07  MN-CAR              pic x(20).
                   07  MN-EXTRA-LEAVE      pic 9(10) comp.
                   07  MN-BONUS            pic 9(2) comp.

               05  MN-PREVIOUS-JOBS        pic x(20) occurs 6 times.

               05  MN-COMMENT.
                   07  MN-COMMENTS             pic x(60).
                   07  MN-AUTHOR-EMP-CODE.
                       09  MN-AUTHOR-POS       pic x.
                       09  MN-AUTHOR-NUM       pic 9(6).

       01  EXECUTIVE-REC.
           03  EX-CODE.
               05  EX-POSITION             pic x.
               05  EX-EMP-NUM              pic 9(6).
           03  EX-AGE                  pic 9(2) comp.
           03  EX-YEARS-WITH-COMPANY   pic 9(2) comp.
           03  EX-DETAILS.
               05  EX-NAME.
                   07  EX-TITLE                pic x(5).
                   07  EX-SURNAME              pic x(50).
                   07  EX-INITIALS             pic x(10).
                   07  EX-FIRST-NAME           pic x(50).
               05  EX-ADDRESS.
                   07  EX-STREET               pic x(40).
                   07  EX-TOWN                 pic x(40).
                   07  EX-AREA                 pic x(40).
               05  EX-JOB-TITLE            pic x(80).
               05  EX-DEPARTMENT           pic x(4).
               05  EX-SALARY               pic 9(16)v9(2) comp.
               05  EX-BASIC-LEAVE          pic 9(10) comp-3.
               05  EX-AVERAGE-HOURS-WEEK   pic 9 comp.

               05  EX-EXTRAS.
                   07  EX-HOUSE            pic x.
                   07  EX-CAR              pic x(20).
                   07  EX-EXTRA-LEAVE      pic 9(10) comp.
                   07  EX-BONUS            pic 9(3) comp.
                   07  EX-ADDITIONAL-LEAVE  pic 9(5).
                   07  EX-GOLF-ALLOWANCE   redefines
                       EX-ADDITIONAL-LEAVE pic 9(3)v9(2) comp.

               05  EX-PREVIOUS-JOBS        pic x(20) occurs 8 times.

               05  EX-COMMENT.
                   07  EX-COMMENTS             pic x(90).
                   07  EX-AUTHOR-EMP-CODE.
                       09  EX-AUTHOR-POS       pic x.
                       09  EX-AUTHOR-NUM       pic 9(6).

       FD stafffile.
       01 staff_file_rec.
         03 staff_file pic x(300) value
             "C:\Users\jhaji\source\repos\ConduitPractice\datavseq.dat". .


       Working-Storage Section.
       01 FILE-STATUS pic x(2).
       01  REC-LEN pic 9(4) comp.
       01 anykey pic x(80).
      *01 staff_file pic x(300) value
      *"C:\Users\jhaji\source\repos\ConduitPractice\datavseq.dat".




       procedure division. 

      *    open i-o MF-FILE.
           open i-o stafffile.
           read stafffile record into EMPLOYEE-REC.
           display EM-NAME.
           display "Enter any key to continue"
           accept anykey.
           close MF-FILE.
      *    exec ado declare staffile datarows from staff_file
      *    end-exec

                 
           goback.
       end Program.