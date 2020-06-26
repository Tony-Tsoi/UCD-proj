function report(ft, fg)
    numTests = 5000;

    numFaults = getNumFaults(ft, fg);
    numPFaults = getPseudexNumFaults(ft, fg);
    
    % Exhaustive
    xexhau = exhauTest(ft, fg, numTests);
    cexhau = cumsum(xexhau);
    pexhau = cexhau/numFaults*100;
    
    % Pseudoexhaustive
    xpsdex = pseudexTest(ft, fg, numTests);
    cpsdex = cumsum(xpsdex);
    ppsdex = cpsdex/numPFaults*100;
    
    % Pseudorandom
    xrand = randomTest(ft, fg, numTests);
    crand = cumsum(xrand);
    prand = crand/numFaults*100;
    
    % Plot
    x = 1:numTests;
    figure; plot(x, pexhau, x, ppsdex, x, prand); xlim([0, numTests]);
    legend('Exhaustive', 'Pseudoexhaustive', 'Pseudorandom');
    legend('Location','southeast')
    xlabel('Number of Tests'); ylabel('Fault Coverage (%)');
    title('Fault Coverage vs Number of Tests')
    
    % Display
    fprintf("Fault Coverage of Exhaustive\t\t = %.2f%%\n", pexhau(end));
    fprintf("Fault Coverage of Pseudoexhaustive\t = %.2f%%\n", ppsdex(end));
    fprintf("Fault Coverage of Pseudorandom\t\t = %.2f%%\n", prand(end));
end