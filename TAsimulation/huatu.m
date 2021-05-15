% % figure(1)
% % subplot(2,2,[1 3])
% % plot (time(1,:)*0.5,yP_50(1,:),'linewidth',1);
% % hold on
% % plot(time(1,:)*0.5,y2,'Color',[0.3,0.2,0.5],'linewidth',2);
% % xlabel ('time [ps] ','linewidth',3,'FontSize',13)
% % ylabel ('intensity [normalized]','linewidth',3,'FontSize',13)
% % 
% % subplot(2,2,[2])
% % stem(Tao_p(:),mat(:))
% % xlim([0.005 0.15])
% % xlabel ('tau [ps^-^1] ','linewidth', 3,'FontSize',13)
% % ylabel ('intensity [normalized]', 'linewidth',3,'FontSize',13)
% % subplot(2,2,[4])
% % 
% % stem(Tao(:),mat(:),'filled','red')
% % xlim([0.005 0.15])
% % xlabel ('tau [ps^-^1] ','linewidth', 3,'FontSize',13)
% % ylabel ('intensity [normalized]', 'linewidth',3,'FontSize',13)
% 
% figure(2)
% subplot(2,2,[1 3])
% plot (time(1,:)*0.5,yP_100(1,:),'linewidth',1);
% hold on
% plot(time(1,:)*0.5,y2,'Color',[0.3,0.2,0.5],'linewidth',2);
% xlabel ('time [ps] ','linewidth',3,'FontSize',13)
% ylabel ('intensity [normalized]','linewidth',3,'FontSize',13)
% 
% subplot(2,2,[2])
% stem(Tao(:),mat(:))
% xlim([0.005 0.15])
% xlabel ('tau [ps^-^1] ','linewidth', 3,'FontSize',13)
% ylabel ('intensity [normalized]', 'linewidth',3,'FontSize',13)
% subplot(2,2,[4])
% 
% stem(Tao_p(:),mat(:),'filled','red')
% xlim([0.005 0.15])
% xlabel ('tau [ps^-^1] ','linewidth', 3,'FontSize',13)
% ylabel ('intensity [normalized]', 'linewidth',3,'FontSize',13)

%figure 2a

% figure(1)
% load ('figure1b.mat')
% subplot(2,2,[1])
% rT = 0.05*randn(100,1)+0.2
% 
% scatter(wave',rT,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5)
% xlabel ('wavelength [normalized]', 'linewidth',3,'FontSize',13)
% ylabel ('Simulated Amplitude ratio','linewidth', 3,'FontSize',13)
% ylim([0 1])

% subplot(2,2,[3])
% load ('figure1b.mat')
% for i = [1:100]
%    
%   scatter(wave(1,i),1/t1(i,1),'c','g')
%   hold on 
%   scatter(wave(1,i),1/(t2(i,1)),'c','g')
%   hold on 
%    
% end
% hold on
% 
% hold on 
% cd DBSCAN-master\
% demo
% clear all 
% cd ..
% 
% load ('figure2a_1.mat')
% subplot(2,2,[2])
% scatter(wave',rT,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5)
%           
% xlabel ('Wavelength [normalized]', 'linewidth',3,'FontSize',13)
% ylabel ('Simulated Amplitude ratio','linewidth', 3,'FontSize',13)

% subplot(2,2,[4])
% load ('figure2a_1.mat')
% for i = [1:100]
%     if cat(i,1)>cat(i,2)
%         if (t1(i,1)<50)
%   scatter(wave(1,i),1/(2*t1(i,1)),'c','g')
%         else
%             scatter(wave(1,i),1/(t1(i,1)),'c','g')
%   hold on 
%         end
%     else
%   scatter(wave(1,i),1/(t1(i,1)),'c','g')
%   hold on 
%   scatter(wave(1,i),1/(2*t2(i,1)),'c','g')
%   hold on 
%     end
% end
% hold on 
% cd DBSCAN-master\
% demo
% clear all 
% cd ..


% subplot(2,2,[4])
% load ('figure2a_1.mat')
% for i = [1:100]
%     if cat(i,1)>cat(i,2)
%         if (t1(i,1)<50)
%   scatter(wave(1,i),1/(2*t1(i,1)),'c','g')
%         else
%             scatter(wave(1,i),1/(t1(i,1)),'c','g')
%   hold on 
%         end
%     else
%   scatter(wave(1,i),1/(t1(i,1)),'c','g')
%   hold on 
%   scatter(wave(1,i),1/(2*t2(i,1)),'c','g')
%   hold on 
%     end
% end
% hold on 
% cd DBSCAN-master\
% demo
% clear all 
% cd ..


% end

% figure2b
% load ('figure2a_1.mat')
% figure(2)
% 
% subplot(2,1,1)
% guodu = [x_p',Clust]
% class_0 = guodu(find(guodu(:,2)==0),1);
% class_1 = guodu(find(guodu(:,2)==1),1);
% e = intersect(class_0,class_1)
% 
% ytrain = zeros(100,2)
% ypred = zeros(100,2)
% for i = [1:100]
%    if rT(i,1) ==1
%        ytrain(i,2)=1;  
%    end
% end
% ypred(e,2) = 1
% plotconfusion(ytrain',ypred')

% 
% load ('figure2a_1.mat')
% subplot(2,1,2)
% ytrain = zeros(100,2)
% ypred = zeros(100,2)
% for i = [1:100]
%    if rT(i,1) ==1
%        ytrain(i,2)=1  
%    end
% end
% ypred = ytrain
% ypred([2,40],2) = 0
% ypred(15,2) = 1
% plotconfusion(ytrain',ypred')



       


% for i = [1:100]
%     if cat(i,1)==1
%     scatter (i,1,'b')
%     hold on 
%     else
%         scatter(i,2,'b')
%         hold on
%     end
% end
%    tbl = tabulate(data(:,1))
%    tbl(find(tbl(:,2)>=2),2)=2
%    scatter(tbl(:,1)*100,tbl(:,2),'g')
%  for i = [1:100]
%      if i==5 | i==97
%          if cat(i,1)==1
%     scatter (i,2,'r')
%     hold on 
%     else
%         scatter(i,1,'r')
%         hold on
%          end
%      else
%     if cat(i,1)==1
%     scatter (i,1,'r')
%     hold on 
%     else
%         scatter(i,2,'r')
%         hold on
%     end
%      end
%  end
 
% data = [0.42;0.97];
% c = categorical({'Lasso','Neural Net work'});
% bar(c,data,0.5);
% 
% ylabel ('accuracy', 'linewidth',3,'FontSize',13)


%%SI
for i = [1:20]
    plot(time,sigD(i,:))
    hold on
end
set(gca,'linewidth',2)
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
xlabel ('time [ps] ','linewidth', 3,'FontSize',24)
 ylabel ('Intensity [normalized]', 'linewidth',3,'FontSize',24)
 
%  for i = [1:100]
% if cat(i,1)==1
% subplot(2,2,[1 3])
% plot(time,sigD(i,:))
% hold on
% set(gca,'linewidth',2)
% set(gca,'FontSize',24,'Fontname', 'Times New Roman');
% xlabel ('time [ps] ','linewidth', 3,'FontSize',24)
%  ylabel ('Intensity [normalized]', 'linewidth',3,'FontSize',24)
% else
%     subplot(2,2,[2 4])
%     plot(time,sigD(i,:))
%     hold on
%     set(gca,'linewidth',2)
% set(gca,'FontSize',24,'Fontname', 'Times New Roman');
% xlabel ('time [ps] ','linewidth', 3,'FontSize',24)
%  ylabel ('Intensity [normalized]', 'linewidth',3,'FontSize',24)
%     
% end
%  end

