package com.example.bai_1.service.iplm;

import com.example.bai_1.model.Customer;
import com.example.bai_1.repository.iplm.CustomerRepository;
import com.example.bai_1.service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> display() {
        return customerRepository.display();
    }
}
