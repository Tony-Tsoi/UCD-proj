function report()
    numTrans = 2^11 * 2;
    
    seqlen = 5000;
    
    % Exhaustive
    cex = exhauTest(seqlen);
    pex = cex/numTrans*100;
    
    % Pseudoexhaustive
    cpe = pseudexTest(seqlen);
    ppe = cpe/numTrans*100;
 
    % Pseudorandom
    cra = randTest(seqlen);
    pra = cra/numTrans*100;
    
    % Plot
    x = 1:seqlen;
    figure; plot(x, pex, x, ppe, x, pra); xlim([0, seqlen]);
    legend('Exhaustive', 'Pseudoexhaustive', 'Pseudorandom');
    legend('Location','northwest');
    xlabel('Length of Test Sequence'); ylabel('Transition Coverage (%)');
    title('Transition Coverage vs Length of Test Sequence');
    
    % Display
    fprintf("Transition Coverage of Exhaustive\t\t = %.2f%%\n", pex(end));
    fprintf("Transition Coverage of Pseudoexhaustive\t = %.2f%%\n", ppe(end));
    fprintf("Transition Coverage of Pseudorandom\t\t = %.2f%%\n", pra(end));
end