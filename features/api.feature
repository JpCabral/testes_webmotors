@screenless
Feature: Test if the Hostgator Financial CEP API is working properly

  Testing some possible CEP request scenarios in the daily usage

  Scenario Outline: Test CEP api inputs and outputs
    Given i am searching for CEP "<cep>"
    When the request is made
    Then check if the return code was <return_code>
    Examples:
      | cep                           | return_code |
      | 74691755                      | 200         |
      | 74691-755                     | 200         |
      | 74.691-755                    | 200         |
      | 74.691755                     | 200         |
      | 00000000                      | 404         |
      | 00.000000                     | 404         |
      | 00000-000                     | 404         |
      | 00.000-000                    | 404         |
      | texto                         | 400         |
      | texto_com_especiais!@#$*&,.-  | 400         |
      | 7%204%206%209%201%207%205%205 | 200         |
