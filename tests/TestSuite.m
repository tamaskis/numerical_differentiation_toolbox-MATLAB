%==========================================================================
%
% TestSuite  Class defining a test suite.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestSuite < handle
    
    % -----------
    % Properties.
    % -----------
    
    properties
        tests   % (N×1 cell array) cell array storing TestEqual and TestNotEqual objects comprising the test suite
        name    % (char) test suite name
        N       % (1×1 double) number of tests comprising test suite
    end
    
    % TODO: TEST SUMMARY, TEST SUITE NAME
    % TODO: remove semicolon from test name, make test names mandatory for
    % TestEqual and TestNotEqual classes
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestSuite(name)
            % obj = TestSuite(name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   name    - (OPTIONAL) (char) test suite name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestSuite) TestSuite object
            %
            %--------------------------------------------------------------
            
            % initializes tests
            obj.tests = {};
            
            % sets test suite name (defaults to empty string)
            if (nargin == 0) || isempty(name)
                obj.name = '';
            else
                obj.name = [name,' '];
            end
            
            % initializes number of tests
            obj.N = 0;
            
        end
        
        function obj = add_test(obj,test)
            % add_test.run
            %
            % Adds a test to the test suite.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   test    - (1×1 TestEqual or TestNotEqual) test to add to
            %             test suite
            %   type    - (char) 'equal' or 'not equal'
            %
            %--------------------------------------------------------------
            
            % adds test to test suite
            obj.tests = [obj.tests,test];
            
            % increments number of tests in test suite
            obj.N = obj.N+1;
            
        end
        
        function obj = run(obj)
            % TestSuite.run
            %
            % Runs all tests in the test suite.
            %--------------------------------------------------------------
            
            % initializes counter to count the number of passed tests
            n_passed = 0;
            
            % runs all tests
            for i = 1:obj.N
                n_passed = obj.tests(i).run(n_passed,obj.N);
            end
            
            % pass rate (%)
            pass_rate = round((n_passed/obj.N)*100);
            
            % prints summary
            fprintf('\n===============================================\n');
            fprintf(['Summary of ',obj.name,'\n']);
            fprintf('-----------------------------------------------\n');
            fprintf('\n');
            fprintf(['  Pass Rate: ',num2str(pass_rate),'%%\n']);
            fprintf(['   • passed tests: ',num2str(n_passed),'\n']);
            fprintf(['   • failed tests: ',num2str(obj.N-n_passed),'\n']);
            fprintf(['   • total number of tests: ',num2str(obj.N),'\n']);
            if n_passed < obj.N
                fprintf('\n');
                fprintf('  Failed Tests:\n');
                for i = 1:obj.N
                    if ~obj.tests(i).passed
                        fprintf(['   • ',obj.tests(i).name,'\n']);
                    end
                end
            end
            fprintf('\n');
            fprintf('===============================================\n');
            
        end
        
    end
    
end