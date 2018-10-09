function [points_in_mat , points_not_in_mat] = seed_point_script(seed_pt,I_test,l,b)


%determine which points satisfy the threshold
points_in_mat = [];
points_not_in_mat = [];
for yi_t_1 = (seed_pt(1) - l/2) : (seed_pt(1) + l/2)
     for xi_t_1 = (seed_pt(2)-b/2) : (seed_pt(2) + b/2)
         if((I_test(xi_t_1,yi_t_1)) <= 205)
             points_in_mat = [points_in_mat ; xi_t_1,yi_t_1];
         else
             points_not_in_mat = [points_not_in_mat; xi_t_1,yi_t_1];
         end
     end
end

% %plot border - green *'s
% for yi_t = (seed_pt(2)-b/2) : (seed_pt(2) + b/2)
%      for xi_t = (seed_pt(1) - l/2) : (seed_pt(1) + l/2)
%          if((yi_t == (seed_pt(2)-b/2)) || (yi_t == (seed_pt(2) + b/2)))
%             plot(xi_t,yi_t,'g*');
%          elseif((yi_t ~= (seed_pt(2)-b/2))||(yi_t ~=(seed_pt(2) + b/2)))
%                   temp1 = (seed_pt(1) - l/2);                 
%                   temp2 = (seed_pt(1) + l/2);
%                   plot(temp1,yi_t,'g*',temp2,yi_t,'g*');
%          end
%     end
% end
% 
% %plot points satisfying threshold from the matrix - blue +'s
% plot(points_in_mat(:,2),points_in_mat(:,1),'b+');
% 
% % plot the seed point in a different color - yellow *
% plot(seed_pt(1),seed_pt(2),'y*');
% axis 'on';
% grid on;
% impixelinfo;
% hold off;

end
