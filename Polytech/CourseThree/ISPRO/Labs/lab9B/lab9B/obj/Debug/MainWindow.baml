   M S B A M L   `   `   `  ����@  <lab9B, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:lab9Blab9B  5   	       lab9B.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:lab9B     5   	     � Title$  
MainWindow��5	   	   $	��350��6   $	��525��6)    � DataContext 5   	   ��  �� RelativeSource �� *Self+ � 	Resources 5
        lab9B.TrolleyBus   ods  Red �� 
TargetType �� Property �� Value 	 Green  textBoxInError �� Triggers P� Property	 P� Value
 �� Self �� Path  validationErrorTemplate �� Orientation �� TextAlignment � ToolTip �� ElementName ��Name��%�  &	        &	      &	 e     &	 �     &	 |      5   
   6   �� 5   
   " ��5      .�5      ��  � ��
 �  ��5      5      �� 5   
   " ��5      .�5      ��  � ��
 � � �5      5      �� 5   
   " ��5       5      P� 5       �@=�HasError	 . . �5      ��  �@�ToolTip 5      �� # Z
 $) #(Validation.Errors)[0].ErrorContent�5       5"      �� 5$   
   .R�5%      ]� .+�5&      �� $ 
Horizontal=�6   $	��Top=�5'      .+�5(      � $��12��6   $��12��5)      .+�5*      A� $��12��6"   $��12��5+   "   
���  ��$��Center=�5-   "   $��Center=�5.   "   6?   �� 50      
�������$��Heavy"�51   $   $��8(�52   $   $��Center=�53   $   $��Center=�54   $   $ Center=�55   $    56   $   �� $ ErrorAdorner��$8 2AdornedElement.(Validation.Errors)[0].ErrorContent�X57   a   58      �� 5:      
���  ��$��12(�5;       $��2,0,0,0q�5<       ��5=       �� $ ErrorAdorner��$8 2AdornedElement.(Validation.Errors)[0].ErrorContent�5>   \   5?      �� 5A      $ ErrorAdorner��5B      5C      5D      5E      5F      .��5G      �  � ColumnDefinitions 5H   
   �� 5I      $��* �6   �� 5J      $��2* �6    � RowDefinitions 5L   
   �� 5M      $��* �6   �� 5N      $��* �6   �� 5O      $��* �6   .+�5R   
   �� -   5        $��Result��5R      " �� VerticalScrollBarVisibility$
 Auto=�5S      $��2��5T      $��2��6   65   �� 5U   
   -   5        $��textBox1��5U      $��15(�5V      $
��Left=�5W      $��	25,25,0,0q�5X      $	��Top=�5Y      $	��125��5Z      $��25��6    =� ErrorTemplate# [ 5[      #��[ 5\      .��6:   ��5]      �� 5^      $ Count�6    �� Source# [  6'    �� UpdateSourceTrigger$ PropertyChanged=�5_       �� ValidationRules 5`        lab9B.TrolleyBusRule  5a      5c      .��5d      5e      �� 5g   
   -   5         ��Name$ button��5g      $��Подтвердить��5h      $
��Left=�5i      $��	25,75,0,0q�5j      $	��Top=�5k      $	��125��5l      $��25��6   ��5m      �� 5n      " ��6   .�5o      ��  � {� .  5p       5q      ^� 5r       ^� 
Conditions 5s      �� 5t   "    �� Binding 6,   �� $ (Validation.HasError)�$ textBox1�� �� Value	 False5u   ,   .0�5w      ��  � {� . 6:   5x      5z      5|      �� 5}   
   -   5        $
��Time��5}      $��15(�5~      $��	25,20,0,0q�5�      $��1��6#   ��5      �� $ StartWorkingTime�5�   #   � 5�   
   -   5        $��	Rodnenkiy��5�      $��2��5�      $��1��6#   5�      5�      5�      