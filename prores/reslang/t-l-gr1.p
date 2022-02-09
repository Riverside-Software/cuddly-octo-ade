/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/* t-l-eng.p - English language definitions for Labels module */

{ prores/t-define.i }

DEFINE INPUT PARAMETER qbf-s AS INTEGER NO-UNDO.

IF qbf-s < 0 THEN RETURN.
qbf-lang = "".

/*--------------------------------------------------------------------------*/
/* l-guess.p:1..5,l-verify.p:6.. */
IF qbf-s = 1 THEN
  ASSIGN
    qbf-lang[ 1] = '��������� ��� "~{1~}" �� ��� �������� ������ "~{2~}" ...'
    qbf-lang[ 2] = '��� �������� ����� ���� ��� �������� ���������.'
    qbf-lang[ 4] = '���������� ��� ������ ��� ��� ���������'
    qbf-lang[ 5] = '�����,�����,��������� #1,��������� #2,��������� #3,�.�.,'
                 + '����,�.�. ��� ���� ����,�����,����'

    qbf-lang[ 6] = '������ ~{1~}: ������/�������� ��������.'
    qbf-lang[ 7] = '������ ~{2~}: ��� ������� �� ����� "~{1~}".'
    qbf-lang[ 8] = '������ ~{2~}: �� ����� "~{1~}", ��� ����� ����� ������.'
    qbf-lang[ 9] = '������ ~{2~}: ��� ����� "~{1~}", ������ - ~{3~} ���������� �� ������� ����.'
    qbf-lang[10] = '������ ~{2~}: �� ����� "~{1~}", ���������� ��� ��-���������� ������.'.

ELSE

/*--------------------------------------------------------------------------*/
/* l-main.p */
IF qbf-s = 2 THEN
  ASSIGN
    /* each entry of 1 and also 2 must fit in format x(6) */
    qbf-lang[ 1] = '���. :,     :,     :,     :,     :'
    qbf-lang[ 2] = '�����:'
    qbf-lang[ 3] = '�������� ���������'
    qbf-lang[ 4] = '�������� ���������'
    qbf-lang[ 5] = '������� ������'
    /*cannot change length of 6 thru 17, right-justify 6-11,13-14 */
    qbf-lang[ 6] = '�����.����� ����:'
    qbf-lang[ 7] = ' ��� ����� �����:'
    qbf-lang[ 8] = ' �������� ����:'
    qbf-lang[ 9] = '���� ���������:'
    qbf-lang[10] = '�������� ������ ����.:'
    qbf-lang[11] = '����� ����.����������:'
    qbf-lang[12] = '(����.)'
    qbf-lang[13] = '������� ����.'
    qbf-lang[14] = '    ��� �����'
    qbf-lang[15] = '�������           ' /* 15..17 used as group.   */
    qbf-lang[16] = '���������         ' /*   do not change length, */
    qbf-lang[17] = '���� ������: ' /*        but do right-justify  */
    qbf-lang[19] = '��� ����� �������� ��� �������� ��������. '
                 + '������ �� ����������; '
    qbf-lang[20] = '�� ���� ��� ��������� ����� ~{1~}, ���� ����� ������ ~{2~} '
                 + '������� �� ����� ��� �������. ������, ������ �������� ��� '
                 + '�� �������� ��� �������, ��� �� ����������. '
                 + '������ �� ���������� �� ��� ��������; '
    qbf-lang[21] = '��� �������� ����� � ������� ��� ��� �������� !'
    qbf-lang[22] = '���������� ��� ������������ ��������� ���������...'
    qbf-lang[23] = '"Compile" ��� ������������ ��������� ���������...'
    qbf-lang[24] = '�������� ��� ������������ ��� �������������...'
    qbf-lang[25] = '������� � ����������� �� �� ������/������'
    qbf-lang[26] = '������� ����������� ��������� - ~{1~} .'
    qbf-lang[27] = 'F. �����'
    qbf-lang[28] = 'A. ������ ������'
    qbf-lang[29] = '������ ��� �������� ��� ��������� ���������� ������ '
                 + '��� ���� �� ���������; '
    qbf-lang[31] = '����������� �������� ��� ���������'
    qbf-lang[32] = '����������� ������ ��� ����� ��� �������'.

ELSE

/*--------------------------------------------------------------------------*/
/* l-main.p */
IF qbf-s = 3 THEN
  ASSIGN
    qbf-lang[ 1] = '��''���� ������ > 1 �������� ���� ������, �� ���� ������ > 0'
    qbf-lang[ 2] = '�� ���� ��������� ��� ������ �� ���� �������� ����'
    qbf-lang[ 3] = '�� �������� ���� ������ �� ����� > 1'
    qbf-lang[ 4] = '������ �� ������� ����������� ��� �������� ���� ������'
    qbf-lang[ 5] = '������ �� ��������� ����������� ��� ��� ����'
    qbf-lang[ 6] = '�� �������� ��������� ��� ������ �� ���� �������� ����'
    qbf-lang[ 7] = '� ��������� �������� ������ ��������� ������ �� ����� > 1'
    qbf-lang[ 8] = '���������� ��� ������� ���� �� ���� ���� ������� ���� ������'
    qbf-lang[ 9] = '������� ����� ������� ��� ��� ���� ����� �� �������'
    qbf-lang[10] = '�� �������� ���� ��� ��������� �� �������'
    qbf-lang[11] = '����� ��������� �� ���������� ���� ������'
    qbf-lang[12] = '����� ����� �� ��������� � ���� ��������'
    qbf-lang[13] = '���� ���� ��� ��� ���� ��� ��������� ����� ��� ����� ���������'
    qbf-lang[14] = '� �������� ��� ��� �������� ���� ���� ��������� ��� ��� �����'.
/*--------------------------------------------------------------------------*/

RETURN.