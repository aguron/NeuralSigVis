
load data_clusterseq.mat

for i=1:3
  switch i
      case 1
          seq=sqTrain{1}{1}; labels=dataInfo{1};
          
          save data_pa_1_train.mat seq labels -mat
          save data_pa_1_train.mat seq labels -mat -append
          seq=seqTest{1}{1}; labels=graphInfo{1};
          save data_pa_1_test.mat seq labels -mat
          save data_pa_1_test.mat seq labels -mat -append 
          
      case 2
          seq=sqTrain{2}{1}; labels=dataInfo{2};
          save data_pa_2_train.mat seq labels -mat
          save data_pa_2_train.mat seq labels -mat -append
          seq=seqTest{2}{1}; labels=graphInfo{2};
          save data_pa_2_test.mat seq labels -mat
          save data_pa_2_test.mat seq labels -mat -append  
      case 3
          seq=sqTrain{3}{1}; labels=dataInfo{3};
          save data_pa_3_train.mat seq labels -mat
          save data_pa_3_train.mat seq labels -mat -append
          seq=seqTest{3}{1}; labels=graphInfo{3};
          save data_pa_3_test.mat seq labels -mat
          save data_pa_3_test.mat seq labels -mat -append      
  end % end of switch i 
end %end of for i=1:3
         
         
   